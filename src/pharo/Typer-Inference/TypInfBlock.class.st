Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfBlock >> definitions [
	^ in
		at: #definition
		ifPresent: [ :s | s collect: #origin ]
		ifAbsent: #()
]

{ #category : #accessing }
TypInfBlock >> transfer [
	| definitions |
	definitions := self definitions.
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: (definitions collect: #inReturnType) typAsMinimizedType
				arguments: (node arguments
						collectWithIndex: [ :x :i | (definitions collect: [ :n | (n inArgumentAt: i) type ]) typAsMinimizedType ]))
				withNode: self)
]
