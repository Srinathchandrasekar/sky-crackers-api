using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using SkyCrackers.Api.Data;
using SkyCrackers.Api.Middleware;
using SkyCrackers.Api.Services;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// 1. Add Database Context using Microsoft SQL Server provider
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

if (builder.Environment.IsProduction() || (connectionString != null && connectionString.Contains(".\\SQLEXPRESS") && !OperatingSystem.IsWindows()))
{
    connectionString = "Server=db71188.databaseasp.net;Database=db71188;User Id=db71188;Password=H!n4et7#2a+A;Encrypt=False;TrustServerCertificate=True;MultipleActiveResultSets=True;";
}
else if (string.IsNullOrWhiteSpace(connectionString))
{
    connectionString = "Server=.\\SQLEXPRESS;Database=SkyCrackersDB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";
}

builder.Services.AddDbContext<SkyCrackersDbContext>(options =>
    options.UseSqlServer(connectionString));

// 2. Register Application Services (Dependency Injection)
builder.Services.AddScoped<IPasswordHasher, PasswordHasher>();
builder.Services.AddScoped<ITokenService, TokenService>();

// 3. Configure JWT Authentication
var jwtSecret = builder.Configuration["Jwt:Secret"] ?? "sky_crackers_production_secret_key_80_off_diwali_2026_super_secure";
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.RequireHttpsMetadata = false;
    options.SaveToken = true;
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSecret)),
        ValidateIssuer = false,
        ValidateAudience = false,
        ClockSkew = TimeSpan.Zero
    };
});

// 4. Configure CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.SetIsOriginAllowed(_ => true)
              .AllowAnyMethod()
              .AllowAnyHeader()
              .AllowCredentials();
    });
});

// 5. Add Controllers and Swagger
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "Sky Fire Crackers ASP.NET Core API",
        Version = "v1",
        Description = "Production ASP.NET Core Web API with Microsoft SQL Server for Sky Fire Crackers Booking System"
    });

    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = SecuritySchemeType.Http,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Description = "Enter JWT Bearer token"
    });

    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            Array.Empty<string>()
        }
    });
});

var app = builder.Build();

// 6. Middleware Pipeline
app.UseMiddleware<ExceptionHandlingMiddleware>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment() || true)
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Sky Fire Crackers API v1");
        c.RoutePrefix = "swagger";
    });
}

app.UseCors("AllowAll");

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

// 7. Auto-repair Customer table columns if needed
using (var scope = app.Services.CreateScope())
{
    try
    {
        var db = scope.ServiceProvider.GetRequiredService<SkyCrackersDbContext>();
        db.Database.ExecuteSqlRaw(@"
            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customer') AND name = 'Address')
            BEGIN
                ALTER TABLE Customer ADD Address NVARCHAR(500) NULL;
            END;

            IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customer') AND name = 'DoorNumber')
            BEGIN
                ALTER TABLE Customer ALTER COLUMN DoorNumber NVARCHAR(50) NULL;
            END;

            IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customer') AND name = 'StreetName')
            BEGIN
                ALTER TABLE Customer ALTER COLUMN StreetName NVARCHAR(150) NULL;
            END;

            IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customer') AND name = 'Area')
            BEGIN
                ALTER TABLE Customer ALTER COLUMN Area NVARCHAR(150) NULL;
            END;

            IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customer') AND name = 'City')
            BEGIN
                ALTER TABLE Customer ALTER COLUMN City NVARCHAR(100) NULL;
            END;

            IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customer') AND name = 'District')
            BEGIN
                ALTER TABLE Customer ALTER COLUMN District NVARCHAR(100) NULL;
            END;

            IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Customer') AND name = 'PinCode')
            BEGIN
                ALTER TABLE Customer ALTER COLUMN PinCode VARCHAR(10) NULL;
            END;
        ");
    }
    catch (Exception ex)
    {
        Console.WriteLine("DB Migration Warning: " + ex.Message);
    }
}

app.Run();
