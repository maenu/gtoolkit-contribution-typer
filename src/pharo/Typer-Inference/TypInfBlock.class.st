Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfBlock >> inReturns [
	^ in
		at: #return
		ifPresent: [ :s | s collect: #origin ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfBlock >> transfer [
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
