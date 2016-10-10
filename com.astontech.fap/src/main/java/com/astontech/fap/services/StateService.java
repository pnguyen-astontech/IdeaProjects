package com.astontech.fap.services;

import com.astontech.fap.domain.State;

/**
 * Created by petenguy1 on 10/10/2016.
 */
public interface StateService {

    Iterable<State> listAllStates();

    State getStateById(Integer id);

    State saveState(State state);

    Iterable<State> saveStateList(Iterable<State> stateIterable);

    void deleteState(Integer id);
}
