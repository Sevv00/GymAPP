package org.gymapp.gymapp.model;
import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;


@Entity
@Table(name = "Users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_DEFAULT)
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", unique = true, nullable = false, updatable = false)
    private Long id;
    @Column(name = "email", unique = true, nullable = false, length = 255)
    private String email;
    @Column(name = "phone_number", unique = true, length = 15)
    private String phoneNumber;
    @Column(name = "hashed_password", nullable = false)
    private String password;
    @Column(name = "first_name", length = 25)
    private String firstName;
    @Column(name = "last_name", length = 50)
    private String lastName;
    @Enumerated(EnumType.STRING)
    @Column(name = "user_role", nullable = false)
    private UserRole userRole;
    @Column(name = "created_at")
    private Timestamp createdAt = new Timestamp(System.currentTimeMillis());
    @Column(name = "last_logged_in_date")
    private Timestamp lastLoggedInDate = new Timestamp(System.currentTimeMillis());
    @Column(name = "is_google")
    private Boolean isGoogle = false;
    @Column(name = "discount", nullable = false)
    private UserDiscount discount;
    @Column(name = "ad_agreement")
    private Boolean addAgreement = false;
    @Column(name = "is_active")
    private Boolean isActive = true;
    @Column(name = "avatar")
    private byte[] avatar;
}
