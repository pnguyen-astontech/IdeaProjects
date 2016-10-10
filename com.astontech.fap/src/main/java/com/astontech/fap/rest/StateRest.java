package com.astontech.fap.rest;

import com.astontech.fap.domain.State;
import com.astontech.fap.services.StateService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by petenguy1 on 10/10/2016.
 */
@RestController
@RequestMapping("/api/state")
public class StateRest {

    private Logger log = Logger.getLogger(UserRest.class);

    @Autowired
    private StateService stateService;

    // GET ALL
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Iterable<State> getAll() {
        return stateService.listAllStates();
    }

    // GET BY ID
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public State getById(@PathVariable int id) {
        return stateService.getStateById(id);
    }

    // SAVE
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public State saveUser(@ModelAttribute("state") State state) {
        return stateService.saveState(state);
    }

    // DELETE
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public Boolean delete(@PathVariable int id) {
        boolean result = false;
        try {
            stateService.deleteState(id);
            result = true;
        } catch (Exception ex) {
            log.info(ex);
        }
        return result;
    }
}
