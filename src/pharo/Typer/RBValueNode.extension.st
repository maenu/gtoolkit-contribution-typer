Extension { #name : #RBValueNode }

{ #category : #'*Typer' }
RBValueNode >> typParseCommentParameters [
	| types |
	types := self comments detect: [ :e | e contents beginsWith: 'typParameters ' ] ifNone: [ ^ {} ].
	types := (types contents copyFrom: 'typParameters ' size + 1 to: types contents size).
	types := $, split: types.
	types := types collect: [ :e | self typParseType: e ].
	^ types
]

{ #category : #'*Typer' }
RBValueNode >> typParseType: aString [
	| clazz i |
	i := aString indexOf: $< ifAbsent: [ aString size ].
	clazz := (aString copyFrom: 1 to: i) asClass.
	^ i < aString size
		ifTrue: [ | parameters |
			parameters := ($, split: (aString copyFrom: i + 1)) collect: [ :f | self typParseType: f ].
			TypParametricType new
				clazz: clazz;
				parameters: parameters;
				yourself ]
		ifFalse: [ TypClassType new
				clazz: clazz;
				yourself ]
]

{ #category : #'*Typer' }
RBValueNode >> typType [
	^ self typTypeWithDiscovered: Dictionary new
]

{ #category : #'*Typer' }
RBValueNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ Object typAsType
]

{ #category : #'*Typer' }
RBValueNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ | type parameters |
			aDictionary at: self put: TypUnknownType instance.
			type := self typTypeRecursiveWithDiscovered: aDictionary.
			parameters := self typParseCommentParameters.
			parameters ifNotEmpty: [ type := type asParametricType: parameters ].
			type ]
]
