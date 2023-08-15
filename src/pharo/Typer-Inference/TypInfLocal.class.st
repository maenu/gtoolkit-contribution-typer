Class {
	#name : #TypInfLocal,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLocal >> findInRead [
	^ context findInRead: self
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
TypInfLocal >> slurp [
	super slurp.
	self flag: #constrain.
	"in
		at: #constrain
		ifPresent: [ :s | s do: [ :e | self constrain: self inRead to: e type ] ]
		ifAbsent: [ self unconstrain: self inRead ]"
]

{ #category : #accessing }
TypInfLocal >> transfer [
	((in at: #next) allSatisfy: [ :e | e origin isKindOf: TypInfAssignment ])
		ifTrue: [ ^ state at: self inRead put: self type ].
	state at: self put: (state at: self inRead)
]
