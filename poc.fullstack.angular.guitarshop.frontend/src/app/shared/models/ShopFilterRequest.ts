export class ShopFilterRequest {
    orderBy: string = 'name';
    searchTerm: string = '';
    types: string[] = [];
    brands: string[] = [];
    
    pageNumber: number = 1;
    pageSize: number = 10;
  }
