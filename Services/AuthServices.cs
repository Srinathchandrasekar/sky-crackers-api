using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using SkyCrackers.Api.Models;

namespace SkyCrackers.Api.Services;

public interface IPasswordHasher
{
    string HashPassword(string password, out string salt);
    bool VerifyPassword(string password, string hash, string salt);
}

public class PasswordHasher : IPasswordHasher
{
    private const int Iterations = 100000;
    private const int KeySize = 32;

    public string HashPassword(string password, out string salt)
    {
        byte[] saltBytes = RandomNumberGenerator.GetBytes(16);
        salt = Convert.ToHexString(saltBytes).ToLowerInvariant();

        byte[] hashBytes = Rfc2898DeriveBytes.Pbkdf2(
            Encoding.UTF8.GetBytes(password),
            Convert.FromHexString(salt),
            Iterations,
            HashAlgorithmName.SHA256,
            KeySize);

        return Convert.ToHexString(hashBytes).ToLowerInvariant();
    }

    public bool VerifyPassword(string password, string hash, string salt)
    {
        try
        {
            // Try hex-decoded salt bytes
            byte[] saltBytes = Convert.FromHexString(salt);
            byte[] hashBytes = Rfc2898DeriveBytes.Pbkdf2(
                Encoding.UTF8.GetBytes(password),
                saltBytes,
                Iterations,
                HashAlgorithmName.SHA256,
                KeySize);

            string computedHash = Convert.ToHexString(hashBytes).ToLowerInvariant();
            if (CryptographicOperations.FixedTimeEquals(
                Encoding.UTF8.GetBytes(computedHash),
                Encoding.UTF8.GetBytes(hash)))
            {
                return true;
            }
        }
        catch { }

        // Also fallback to UTF8 salt bytes (standard cross-platform compatibility)
        byte[] hashBytesUtf8 = Rfc2898DeriveBytes.Pbkdf2(
            Encoding.UTF8.GetBytes(password),
            Encoding.UTF8.GetBytes(salt),
            Iterations,
            HashAlgorithmName.SHA256,
            KeySize);

        string computedHashUtf8 = Convert.ToHexString(hashBytesUtf8).ToLowerInvariant();
        return CryptographicOperations.FixedTimeEquals(
            Encoding.UTF8.GetBytes(computedHashUtf8),
            Encoding.UTF8.GetBytes(hash));
    }
}

public interface ITokenService
{
    string GenerateAdminToken(AdminUser user);
    string GenerateCustomerToken(Customer customer);
    ClaimsPrincipal? ValidateCustomerToken(string token);
}

public class TokenService : ITokenService
{
    private readonly IConfiguration _config;

    public TokenService(IConfiguration config)
    {
        _config = config;
    }

    public string GenerateAdminToken(AdminUser user)
    {
        var secret = _config["Jwt:Secret"] ?? "sky_crackers_production_secret_key_80_off_diwali_2026_super_secure";
        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
        var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var claims = new[]
        {
            new Claim(ClaimTypes.NameIdentifier, user.AdminUserId.ToString()),
            new Claim(ClaimTypes.Name, user.Username),
            new Claim(ClaimTypes.Email, user.Email),
            new Claim(ClaimTypes.Role, user.Role),
            new Claim("UserType", "Admin")
        };

        var token = new JwtSecurityToken(
            issuer: _config["Jwt:Issuer"] ?? "SkyCrackers.Api",
            audience: _config["Jwt:Audience"] ?? "SkyCrackers.Client",
            claims: claims,
            expires: DateTime.UtcNow.AddDays(7),
            signingCredentials: creds
        );

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    public string GenerateCustomerToken(Customer customer)
    {
        var secret = _config["Jwt:Secret"] ?? "sky_crackers_production_secret_key_80_off_diwali_2026_super_secure";
        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
        var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var claims = new[]
        {
            new Claim(ClaimTypes.NameIdentifier, customer.CustomerId.ToString()),
            new Claim(ClaimTypes.MobilePhone, customer.MobileNumber),
            new Claim(ClaimTypes.Name, customer.CustomerName),
            new Claim("UserType", "Customer")
        };

        var token = new JwtSecurityToken(
            issuer: _config["Jwt:Issuer"] ?? "SkyCrackers.Api",
            audience: _config["Jwt:Audience"] ?? "SkyCrackers.Client",
            claims: claims,
            expires: DateTime.UtcNow.AddHours(24),
            signingCredentials: creds
        );

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    public ClaimsPrincipal? ValidateCustomerToken(string token)
    {
        if (string.IsNullOrWhiteSpace(token)) return null;

        var secret = _config["Jwt:Secret"] ?? "sky_crackers_production_secret_key_80_off_diwali_2026_super_secure";
        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));

        var handler = new JwtSecurityTokenHandler();
        try
        {
            var principal = handler.ValidateToken(token, new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = key,
                ValidateIssuer = false,
                ValidateAudience = false,
                ClockSkew = TimeSpan.FromMinutes(5)
            }, out _);

            return principal;
        }
        catch
        {
            return null;
        }
    }
}
