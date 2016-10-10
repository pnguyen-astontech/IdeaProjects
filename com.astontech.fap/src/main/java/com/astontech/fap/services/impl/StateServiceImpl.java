package com.astontech.fap.services.impl;

import com.astontech.fap.domain.State;
import com.astontech.fap.repositories.StateRepository;
import com.astontech.fap.services.StateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by petenguy1 on 10/10/2016.
 */
@Service
public class StateServiceImpl implements StateService {

    @Autowired
    private StateRepository stateRepository;

    @Override
    public Iterable<State> listAllStates() {
        return stateRepository.findAll();
    }

    @Override
    public State getStateById(Integer id) {
        return stateRepository.findOne(id);
    }

    @Override
    public State saveState(State state) {
        return stateRepository.save(state);
    }

    @Override
    public Iterable<State> saveStateList(Iterable<State> stateIterable) {
        return stateRepository.save(stateIterable);
    }

    @Override
    public void deleteState(Integer id) {
        stateRepository.delete(id);
    }
}
