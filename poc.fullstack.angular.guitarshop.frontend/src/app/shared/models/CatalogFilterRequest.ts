export class CatalogFilterRequest {
    orderBy: string = 'name';
    searchTerm: string = '';
    types: string[] = [];
    brands: string[] = [];
    
    pageNumber: number = 1;
    pageSize: number = 10;
  }
