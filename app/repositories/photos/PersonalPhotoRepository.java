package repositories.photos;

import io.ebean.BeanRepository;
import io.ebean.Ebean;
import models.Profile;
import models.photos.PersonalPhoto;

public class PersonalPhotoRepository extends BeanRepository<Long, PersonalPhoto> {


    public PersonalPhotoRepository() {
        super(PersonalPhoto.class, Ebean.getServer("default"));
    }

    /**
     * Fetches a single personal photo by the photo id number.
     *
     * @param photoId   the id number of the photo.
     * @return          the PersonalPhoto object given by the personal photo.
     */
    public PersonalPhoto fetch(Long photoId) {
        return PersonalPhoto.getFind().byId(photoId.intValue());
    }


    /**
     * Deletes a personal photo.
     *
     * @param photo      the PersonalPhoto object of the photo.
     */
    public boolean delete(PersonalPhoto photo) {
        return photo.delete();
    }

    /**
     * Updates a personal photo.
     *
     * @param photo      the PersonalPhoto object of the photo.
     */
    public void update(PersonalPhoto photo) {
        photo.update();
    }


    /**
     * Updates the privacy of the of the specified photo to either public or private.
     *
     * @param photoOwner the Profile object of the owner of the photo.
     * @param photo      the PersonalPhoto object of the photo.
     * @param isPublic   the new Boolean value of the photos public or private value.
     */
    public void updatePrivacy(Profile photoOwner, PersonalPhoto photo, String isPublic) {
        photo.setPublic(Boolean.parseBoolean(isPublic));
        photo.update();
        photoOwner.update();
    }
}
