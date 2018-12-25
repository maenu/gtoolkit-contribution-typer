Class {
	#name : #TypShaPhaContext,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaContext class >> shadowedClass [
	^ Context class
]

{ #category : #accessing }
TypShaPhaContext >> ___arguments [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | SequenceableCollection typAsType asParametricType: {Object typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaContext >> ___method [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaContext >> ___receiver [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Object typAsType ];
		yourself
]
