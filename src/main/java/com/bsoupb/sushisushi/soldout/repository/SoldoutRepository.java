package com.bsoupb.sushisushi.soldout.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bsoupb.sushisushi.soldout.domain.Soldout;

public interface SoldoutRepository extends JpaRepository<Soldout, Integer>{

}
