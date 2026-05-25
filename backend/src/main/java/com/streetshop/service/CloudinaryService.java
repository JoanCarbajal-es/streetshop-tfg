package com.streetshop.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
public class CloudinaryService {

    @Autowired
    private Cloudinary cloudinary;

    /**
     * Sube una imagen a Cloudinary y devuelve la URL segura.
     *
     * @param file  Archivo recibido desde el frontend
     * @return      URL pública de la imagen subida
     */
    public String uploadImage(MultipartFile file) throws IOException {
        Map<?, ?> result = cloudinary.uploader().upload(
                file.getBytes(),
                ObjectUtils.asMap(
                        "folder",          "streetshop/products",
                        "resource_type",   "image",
                        "transformation",  "q_auto,f_auto"
                )
        );
        return (String) result.get("secure_url");
    }

    /**
     * Elimina una imagen de Cloudinary por su public_id.
     *
     * @param publicId  El public_id de la imagen (sin extensión)
     */
    public void deleteImage(String publicId) throws IOException {
        cloudinary.uploader().destroy(publicId, ObjectUtils.emptyMap());
    }
}