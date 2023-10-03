Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #converting }
TypInfBlock >> asFunction [
	^ self type
]

{ #category : #accessing }
TypInfBlock >> definitions [
	^ in
		at: #definition
		ifPresent: [ :s | s collect: #origin ]
		ifAbsent: #()
]

{ #category : #accessing }
TypInfBlock >> signalsAlways [
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
TypInfBlock >> transfer [
	| definitions |
	definitions := self definitions.
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: (definitions collect: #inReturnType)
						typAsMinimizedType
				arguments: (node arguments
						collectWithIndex: [ :x :i | (definitions collect: [ :n | (n inArgumentAt: i) type ]) typAsMinimizedType ])
				argumentsOptional: false
				signalsAlways: self signalsAlways) withNode: self)
]
