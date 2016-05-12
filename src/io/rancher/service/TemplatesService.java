package io.rancher.service;

import io.rancher.base.Filters;
import io.rancher.base.TypeCollection;
import io.rancher.type.Task;
import io.rancher.type.Templates;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;
import retrofit2.http.QueryMap;

public interface TemplatesService {

  @GET("templates")
  Call<TypeCollection<Templates>> list();

  @GET("templates")
  Call<TypeCollection<Templates>> list(@QueryMap Filters filters);
  
  @GET("templates/{id}")
  Call<Templates> get(@Path("id") String id);
}
