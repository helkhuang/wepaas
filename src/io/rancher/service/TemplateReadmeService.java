package io.rancher.service;

import io.rancher.base.TypeString;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface TemplateReadmeService {
  
  @TypeString
  @GET("templates/{id}?readme")
  Call<ResponseBody> get(@Path("id") String id);
}
