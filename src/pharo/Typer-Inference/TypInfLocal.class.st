Class {
	#name : #TypInfLocal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLocal >> constrainTo: aType from: aNode [
	super constrainTo: aType from: aNode.
	self inRead constrainTo: aType from: aNode
]

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
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ state at: self inRead put: self previous ].
	self put: (state at: self inRead ifAbsent: [ TypUnknownType instance ])
]
