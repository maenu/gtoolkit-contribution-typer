Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'parameters'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #comparing }
TypParametricType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypGenericType".
					name = object name and: [ parameters = object parameters ] ] ]
]

{ #category : #comparing }
TypParametricType >> > aType [
	^ aType isParametric
		and: [ super > aType
				and: [ | type_ |
					type_ := aType "typCastAs TypGenericType".
					parameters size = type_ parameters size
						and: [ (parameters withIndexSelect: [ :e :i | e >= (type_ parameters at: i) ]) size = parameters size ] ] ]
]

{ #category : #accessing }
TypParametricType >> asTypeCompatibleWith: aType [
	"Assume parameters map with parameters of super type."
self flag: 'TODO rewrite with new scope logic'.
	^ aType isParametric
		ifTrue: [ | type_ minSize parameters_ |
			type_ := aType "typCastAs TypGenericType".
			minSize := parameters size min: type_ parameters size.
			parameters_ := (minSize
				timesCollect: [ :i | 
					(parameters at: i)
						asTypeCompatibleWith: (type_ parameters at: i) ])
				,
					(type_ parameters
						copyFrom: minSize + 1
						to: type_ parameters size).
			type_ copy
				parameters: parameters_;
				yourself ]
		ifFalse: [ super asTypeCompatibleWith: aType ]
]

{ #category : #comparing }
TypParametricType >> hash [
	^ super hash bitXor: parameters hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	<typTypeVariable: 'parameters' as: 'OrderedCollection<TypType>'>
	super initialize.
	parameters := OrderedCollection new "typParameters TypType"
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
]

{ #category : #accessing }
TypParametricType >> parameters [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ parameters
]

{ #category : #accessing }
TypParametricType >> parameters: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	(anObject allSatisfy: #isTypeVariable)
		ifTrue: [ parameters := anObject asOrderedCollection ]
		ifFalse: [ | template |
			template := self classDescription typAsType.
			self
				assert: [ template isParametric
						and: [ anObject size = template parameters size
								and: [ template parameters allSatisfy: #isTypeVariable ] ] ].
			parameters := template parameters collect: #copy.
			template parameters
				withIndexDo: [ :e :i | 
					| parameter |
					parameter := anObject at: i.
					parameter isTypeVariable
						ifTrue: [ self assert: [ parameter = e ] ]
						ifFalse: [ scope at: e name put: parameter ] ] ]
]

{ #category : #copying }
TypParametricType >> postCopy [
	super postCopy.
	parameters := parameters collect: #copy
]

{ #category : #printing }
TypParametricType >> printOn: aStream [
	super printOn: aStream.
	aStream << '<'.
	1 to: parameters size do: [ :i | 
		((parameters at: i) resolveIn: scope) printOn: aStream.
		i < parameters size
			ifTrue: [ aStream << ',' ] ].
	aStream << '>'
]

{ #category : #accessing }
TypParametricType >> superType [
	"Assume parameters map with parameters of super type."

	| superType |
	self flag: 'TODO rewrite with new scope logic'.
	superType := super superType.
	^ superType isParametric
		ifTrue: [ | superType_ minSize parameters_ |
			superType_ := superType "typCastAs TypParametricType".
			minSize := parameters size min: superType_ parameters size.
			parameters_ := (parameters copyFrom: 1 to: minSize)
				,
					(superType parameters
						copyFrom: minSize + 1
						to: superType parameters size).
			superType_ copy
				parameters: parameters_;
				yourself ]
		ifFalse: [ superType ]
]

{ #category : #testing }
TypParametricType >> validateAsSuperTypeOf: aType [
	^ aType isParametric
		ifTrue: [ parameters
				do: [ :e | 
					((aType parameters includes: e)
						or: [ (e resolveIn: scope) isTypeVariable not ])
						ifFalse: [ scope at: e put: TypUnknownType instance ] ] ]
		ifFalse: [ parameters
				do: [ :e | 
					(e resolveIn: scope) isTypeVariable not
						ifFalse: [ scope at: e put: TypUnknownType instance ] ] ]
]
