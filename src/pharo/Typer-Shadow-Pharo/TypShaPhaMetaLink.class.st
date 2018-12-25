Class {
	#name : #TypShaPhaMetaLink,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMetaLink class >> shadowedClass [
	^ MetaLink class
]

{ #category : #accessing }
TypShaPhaMetaLink >> ___arguments: _a [
	^ TypMethodResolver new
		argumentTypes:
				[ :i :a :s :r | SequenceableCollection typAsType asParametricType: {Symbol typAsType} ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaMetaLink >> ___control: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaMetaLink >> ___metaObject: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			Object typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaMetaLink >> ___selector: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
