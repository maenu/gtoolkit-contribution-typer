Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethod >> inReturns [
	^ in
		at: #return
		ifPresent: [ :s | (s collect: #origin) reject: #isDead ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfMethod >> methodNode [

	^ self
]

{ #category : #accessing }
TypInfMethod >> signalsAlways [
	self inReturns ifNotEmpty: [ ^ nil ].
	^ in
		at: #signal
		ifPresent: [ :s | 
			(s reject: [ :e | e origin isDead ])
				ifEmpty: [ nil ]
				ifNotEmpty: [ :ss | (ss collect: [ :e | e exception ]) typAsMinimizedType ] ]
		ifAbsent: [ nil ]
]

{ #category : #accessing }
TypInfMethod >> transfer [
	state
		at: self
		put: (CompiledMethod
				typAsFunctionTypeWithResult: (self inReturns collect: #type)
						typAsMinimizedType
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: self signalsAlways)
]
