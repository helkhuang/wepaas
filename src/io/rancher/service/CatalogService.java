package io.rancher.service;

import io.rancher.base.Filters;
import io.rancher.base.TypeCollection;
import io.rancher.type.Catalog;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.QueryMap;

public interface CatalogService {

	  @GET("catalogs")
	  Call<TypeCollection<Catalog>> list();

	  @GET("catalogs")
	  Call<TypeCollection<Catalog>> list(@QueryMap Filters filters);
  
}
