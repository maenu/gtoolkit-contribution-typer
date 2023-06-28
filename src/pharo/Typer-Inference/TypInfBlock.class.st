Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfBlock >> inReturn [

	^ ((in at: #tighten) detect: #isReturn) origin
]

{ #category : #accessing }
TypInfBlock >> initialize: aState [
	super initialize: aState.
	^ state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType instance
				arguments: (node arguments collect: [ :e | TypUnknownType instance ])
				argumentsOptional: false
				signalsAlways: nil)
				typInfNode: self;
				yourself)
]

{ #category : #accessing }
TypInfBlock >> tighten: aType in: aState [
	self inArguments
		withIndexDo: [ :n :i | 
			i <= aType arguments size
				ifTrue: [ aState
						covariantFrom: self
						to: n
						with: (aType arguments at: i) ] ].
	in
		at: #tighten
		ifPresent: [ :s | 
			s
				detect: #isReturn
				ifFound: [ :e | 
					aState
						covariantFrom: self
						to: e origin
						with: aType result ]
				ifNone: [ self flag: 'do what?' ] ]
		ifAbsent: [ self flag: 'do what?' ]
]
