package models;

import javax.persistence.Entity;

@Entity
public class Passport extends BaseModel {

    private String country;

    public String getCountry() {
        return country;
    }



}
