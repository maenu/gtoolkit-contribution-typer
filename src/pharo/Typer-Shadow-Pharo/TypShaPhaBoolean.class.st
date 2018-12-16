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
		argumentTypes: [ {Boolean typAsType.
			(BlockClosure typAsType asFunctionType: {} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBoolean >> ___ifFalse: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ];
		resultType: [ :a :s :r | 
			(a argumentTypes at: 1) result copy
				nullable: true;
				yourself ];
		yourself
]

{ #category : #accessing }
TypShaPhaBoolean >> ___ifTrue: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ];
		resultType: [ :a :s :r | 
			(a argumentTypes at: 1) result copy
				nullable: true;
				yourself ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___ifTrue: _a ifFalse: _b [
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ];
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
		argumentTypes: [ {Boolean typAsType.
			(BlockClosure typAsType asFunctionType: {} result: Boolean typAsType optionalParameters: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]
