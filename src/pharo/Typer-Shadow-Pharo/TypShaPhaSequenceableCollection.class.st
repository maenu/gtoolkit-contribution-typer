Class {
	#name : #TypShaPhaSequenceableCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> ___ofSize: _a [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> shadowedClass [
	^ SequenceableCollection class
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___at: _a [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___copyFrom: _a to: _b [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___detectIndex: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: i).
					Boolean typAsType} ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___first [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___isEmpty [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___last [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #enumerating }
TypShaPhaSequenceableCollection >> ___withIndexDo: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: i).
					Integer typAsType.
					a receiverType} ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {TypUnknownType instance}
]
