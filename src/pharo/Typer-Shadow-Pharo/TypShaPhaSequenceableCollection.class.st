Class {
	#name : #TypShaPhaSequenceableCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> _ofSize: _a [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> shadowedClass [
	^ SequenceableCollection class
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> _at: _a [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> _copyFrom: _a to: _b [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> _detectIndex: _a [
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
TypShaPhaSequenceableCollection >> _last [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #enumerating }
TypShaPhaSequenceableCollection >> _withIndexDo: _a [
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
