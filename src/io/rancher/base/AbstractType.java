package io.rancher.base;

public abstract class AbstractType implements java.io.Serializable {

    private String id;

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
