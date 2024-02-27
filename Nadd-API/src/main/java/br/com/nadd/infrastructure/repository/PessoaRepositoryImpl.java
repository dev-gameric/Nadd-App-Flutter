package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.Pessoa;
import br.com.nadd.repository.PessoaRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Component;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Component
public class PessoaRepositoryImpl implements PessoaRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Pessoa> listar(){
        return manager.createQuery("from Pessoa", Pessoa.class).getResultList();
    }

    @Override
    public Pessoa buscar(Long id) {
        return manager.find(Pessoa.class,id);
    }

    @Transactional
    @Override
    public Pessoa salvar(Pessoa pessoa) {
        return manager.merge(pessoa);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        Pessoa pessoa = buscar(id);

        if(pessoa == null){
            throw new EmptyResultDataAccessException(1);
        }
    }

    @Override
    public Pessoa findByUsername(String email) {
        String jpql = "select p from Pessoa p where p.email like :email"; // Corrigido para :email
        TypedQuery<Pessoa> query = manager.createQuery(jpql, Pessoa.class);
        query.setParameter("email", "%" + email + "%");

        return query.getSingleResult(); // Como é uma busca por um usuário único, use getSingleResult()
    }

    @Override
    public List<Pessoa> findAll() {
        return null;
    }

    @Override
    public List<Pessoa> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<Pessoa> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public List<Pessoa> findAllById(Iterable<Long> longs) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Long aLong) {

    }

    @Override
    public void delete(Pessoa entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends Long> longs) {

    }

    @Override
    public void deleteAll(Iterable<? extends Pessoa> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public <S extends Pessoa> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Pessoa> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Pessoa> findById(Long aLong) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Long aLong) {
        return false;
    }

    @Override
    public void flush() {

    }

    @Override
    public <S extends Pessoa> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends Pessoa> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteAllInBatch(Iterable<Pessoa> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<Long> longs) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public Pessoa getOne(Long aLong) {
        return null;
    }

    @Override
    public Pessoa getById(Long aLong) {
        return null;
    }

    @Override
    public <S extends Pessoa> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends Pessoa> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends Pessoa> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends Pessoa> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends Pessoa> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends Pessoa> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends Pessoa, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }
}
