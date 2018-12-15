Class {
	#name : #TypShaPhaBoolean,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBoolean class >> shadowedClass [
	^ Boolean class
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___and: _a [
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType asFunctionType: {} result: Boolean typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___ifTrue: _a ifFalse: _b [
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance ];
		resultType: [ :a | 
			(a argumentTypes
				collect: [ :e | 
					e isFunction
						ifTrue: [ e result ]
						ifFalse: [ TypUnknownType instance ] ]) typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___not [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___or: _a [
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType asFunctionType: {} result: Boolean typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]
