package models;

import io.ebean.Finder;
import javax.persistence.Entity;

@Entity
public class Passport extends BaseModel {

    private String country;

    public String getCountry() {
        return country;
    }


    public static final Finder<Integer, Passport> find = new Finder<>(Passport.class);
}
