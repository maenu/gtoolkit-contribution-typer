Class {
	#name : #TypInfLocal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'meta-object-protocol' }
TypInfLocal >> inRead [

	^ self inAt: #read
]

{ #category : #'meta-object-protocol' }
TypInfLocal >> inRead: aNode [

	^ self inAt: #read put: aNode
]

{ #category : #accessing }
TypInfLocal >> transfer [
	self flag: 'TODO does assignment need special treatment?'.
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ ^ state at: self inRead put: self type ].
	state at: self put: (state at: self inRead)
]
