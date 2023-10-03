Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethod >> asFunction [
	^ self type
]

{ #category : #accessing }
TypInfMethod >> lookup [
	^ TypMethodLookup
		receiver: context self
		selector: node selector
		arguments: self arguments
		self: context self
		super: context super
		parent: nil
]

{ #category : #accessing }
TypInfMethod >> methodNode [

	^ self
]

{ #category : #accessing }
TypInfMethod >> signalsAlways [
	in
		at: #return
		ifPresent: [ :s | (s reject: [ :e | e origin isDead ]) ifNotEmpty: [ ^ nil ] ].
	^ in
		at: #signal
		ifPresent: [ :s | 
			(s reject: [ :e | e origin isDead ])
				ifEmpty: [ nil ]
				ifNotEmpty: [ :ss | (ss collect: #exception) typAsMinimizedType ] ]
		ifAbsent: [ nil ]
]

{ #category : #accessing }
TypInfMethod >> transfer [
	state
		at: self
		put: (CompiledMethod
				typAsFunctionTypeWithResult: self inReturnType
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: self signalsAlways)
]
