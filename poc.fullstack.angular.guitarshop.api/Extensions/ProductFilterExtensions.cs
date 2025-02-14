﻿using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Extensions;

public static class ProductFilterExtensions
{
    public static IQueryable<Product> Sort(
        this IQueryable<Product> query, string orderBy)
    {
        if (orderBy is null)
            return query.OrderBy(p => p.Name);

        return orderBy switch
        {
            "priceAsc" => query.OrderBy(p => p.Price),
            "priceDesc" => query.OrderByDescending(p => p.Price),
            _ => query.OrderBy(p => p.Name),
        };
    }

    public static IQueryable<Product> Search(
        this IQueryable<Product> query, string searchTerm)
    {
        if (searchTerm is null)
            return query;

        var lowerCaseSearchTerm = searchTerm.Trim().ToLower();

        return query.Where(p => p.Name.ToLower().Contains(lowerCaseSearchTerm));
    }

    public static IQueryable<Product> Filter(
        this IQueryable<Product> query, string brands, string types)
    {
        var brandList = new List<string>();
        var typeList = new List<string>();

        if (!string.IsNullOrEmpty(brands))
            brandList.AddRange(brands.ToLower().Split(',').ToList());

        if (!string.IsNullOrEmpty(types))
            typeList.AddRange(types.ToLower().Split(',').ToList());

        query = query.Where(p => brandList.Count() == 0 || brandList.Contains(p.Brand.ToLower()));
        query = query.Where(p => typeList.Count() == 0 || typeList.Contains(p.Type.ToLower()));

        return query;
    }
}