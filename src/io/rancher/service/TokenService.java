package io.rancher.service;

import io.rancher.base.Filters;
import io.rancher.type.Token;
import retrofit2.Call;
import retrofit2.http.POST;
import retrofit2.http.QueryMap;

public interface TokenService {
  @POST("token")
  Call<Token> token(@QueryMap Filters filters);
}
