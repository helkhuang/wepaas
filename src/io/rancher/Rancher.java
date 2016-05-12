package io.rancher;

import java.io.IOException;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.rancher.client.BasicAuthInterceptor;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

public class Rancher {

    private final Retrofit retrofit;

    public Rancher(final Config config) {
        OkHttpClient.Builder builder = new OkHttpClient.Builder().
        		addInterceptor(
                BasicAuthInterceptor.auth(config.getAccessKey(), config.getSecretKey())
        );
        builder.addNetworkInterceptor(new Interceptor() {
            @Override
            public Response intercept(Chain chain) throws IOException {
                Request request = chain.request().newBuilder().
                		addHeader("Content-type", "application/json").build();
                return chain.proceed(request);
            }
        });
        this.retrofit = new Retrofit.Builder()
                .baseUrl(config.getUrl().toString())
                .client(builder.build())
                .addConverterFactory(JacksonConverterFactory.create(configureObjectMapper()))
                .build();

    }

    private ObjectMapper configureObjectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        return objectMapper;
    }

    public <T> T type(Class<T> service) {
        return retrofit.create(service);
    }
}