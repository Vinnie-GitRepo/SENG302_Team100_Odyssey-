package models.trips;

import io.ebean.Finder;
import models.BaseModel;
import play.data.validation.Constraints;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

/**
 * Class for holding trips for a user with all their trip destinations and trip name
 */
@Entity
public class Trip extends BaseModel {

    /**
     * The name of the trip.
     */
    @Constraints.Required
    private String name;

    /**
     * The trips destinations for the trip
     */
//    @Constraints.Required

    @OneToMany(mappedBy="trip", cascade=CascadeType.ALL)
    private List<TripDestination> destinations;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<TripDestination> getDestinations() {
        return destinations;
    }

    public void setDestinations(List<TripDestination> destinations) {
        this.destinations = destinations;
    }

    /**
     * A finder used to search for a trip
     */
    public static Finder<Integer, Trip> find = new Finder<>(Trip.class);
}