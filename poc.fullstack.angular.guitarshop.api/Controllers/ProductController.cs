using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Dto;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Extensions;
using poc.fullstack.angular.guitarshop.api.Helper.Pagination;

namespace poc.fullstack.angular.guitarshop.api.Controllers;

[Route("api/v1/[controller]")]
public sealed class ProductController : ControllerBase
{
    private readonly ILogger<ProductController> _logger;
    private readonly GuitarShopContext _context;

    public ProductController
    (
        GuitarShopContext context,
        ILogger<ProductController> logger
    )
    {
        _context = context;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ProductPaginationParamsResponseDto>> GetProductsAsync
    (
        [FromQuery] ProductPaginationParamsRequestDto productParamsDto,
        CancellationToken ct
    )
    {
        var query = _context.Products
            .Sort(productParamsDto.OrderBy)
            .Search(productParamsDto.SearchTerm)
            .Filter(productParamsDto.Brands, productParamsDto.Types)
            .AsQueryable();

        var products = await PagedList<Product>.ToPagedList
            (
                query,
                productParamsDto.PageNumber,
                productParamsDto.PageSize,
                ct
            );
        
        return new ProductPaginationParamsResponseDto 
        {
            CurrentPage = products.PaginationMetaDataDto.CurrentPage,
            PageSize = products.PaginationMetaDataDto.PageSize,
            TotalCount = products.PaginationMetaDataDto.TotalCount,
            TotalPages = products.PaginationMetaDataDto.TotalPages,
            Data = products
        };
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Product>> GetProductByIdAsync
    (
        Guid id,
        CancellationToken ct
    )
    {
        var product = await _context.Products.FindAsync(id, ct);

        if (product is null)
            return NotFound();

        return Ok(product);
    }

    [HttpGet("brands")]
    public async Task<IActionResult> GetBrandsAsync(CancellationToken ct) =>
        Ok(await _context.Products.Select(s => s.Brand).Distinct().ToListAsync(ct));
        

    [HttpGet("types")]
    public async Task<IActionResult> GetTypesAsync(CancellationToken ct) =>
        Ok(await _context.Products.Select(s => s.Type).Distinct().ToListAsync(ct));
}