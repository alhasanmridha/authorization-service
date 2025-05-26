package org.alhasan.authorization

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class Controller {

    @GetMapping("/hello")
    fun sayHello(): ResponseEntity<String> {
        return ResponseEntity.ok("Hello!")
    }
}