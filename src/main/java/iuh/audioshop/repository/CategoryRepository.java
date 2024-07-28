package iuh.audioshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import iuh.audioshop.modal.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

}
