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
TypInfBlock >> inReturns [
	^ in
		at: #return
		ifPresent: [ :s | s collect: #origin ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfBlock >> transfer [
	| definitions |
	definitions := self definitions.
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: (definitions
						flatCollect: [ :n | n inReturns collect: #type ]) typAsType
				arguments: (node arguments
						collectWithIndex: [ :x :i | (definitions collect: [ :n | (n inArgumentAt: i) type ]) typAsType ])
				argumentsOptional: false
				signalsAlways: nil)
				typInfNode: self;
				yourself)
]

{ #category : #accessing }
TypInfBlock >> transfer2 [
	state
		at: self
		put: (in
				at: #definition
				ifPresent: [ :c | 
					(c collect: [ :e | e origin type ]) typAsType copy
						typInfNode: self;
						yourself ]
				ifAbsent: [ (BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: (self inArguments collect: [ TypUnknownType instance ])
						argumentsOptional: false
						signalsAlways: nil)
						typInfNode: self;
						yourself ])
]

{ #category : #accessing }
TypInfBlock >> transfer3 [
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: (((context nodesAt: node) copyWithout: self)
						ifEmpty: [ TypUnknownType instance ]
						ifNotEmpty: [ :s | (s flatCollect: [ :n | n inReturns collect: #type ]) typAsType ])
				arguments: (node arguments
						collectWithIndex: [ :n :i | 
							((context nodesAt: n) copyWithoutAll: self inArguments)
								ifEmpty: [ TypUnknownType instance ]
								ifNotEmpty: [ :s | (s collect: #type) typAsType ] ])
				argumentsOptional: false
				signalsAlways: nil)
				typInfNode: self;
				yourself)
]

{ #category : #accessing }
TypInfBlock >> transfer4 [
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: (self inReturns collect: #type) typAsType
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: nil)
				outAt: #method ifAbsentPut: [ self ];
				typInfNode: self;
				yourself)
]
