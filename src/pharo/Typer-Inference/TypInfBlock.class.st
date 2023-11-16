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
TypInfBlock >> transfer [
	self
		put: ((in
				at: #definition
				ifPresent: [ :s | (s collect: [ :e | e origin type withoutNode ]) typAsMinimizedType ]
				ifAbsent: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: (node arguments collect: [ :n | TypUnknownType instance ]) ])
				withNode: self)
]
