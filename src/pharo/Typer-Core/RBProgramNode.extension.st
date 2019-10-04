Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Core' }
RBProgramNode >> typAnnotateType: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := aType.
	self comments
		detect: #typIsCastAs
		ifFound: [ :e | type := e typCastAs ]
		ifNone: [  ].
	self comments
		detect: #typIsBindings
		ifFound: [ :e | 
			type isParametric
				ifTrue: [ | bindings |
					bindings := e typBindings.
					bindings size = type parameters size
						ifTrue: [ type := type
								copyWithBindings:
									(type parameters withIndexCollect: [ :f :i | f -> (bindings at: i) ])
										asOrderedDictionary ]
						ifFalse: [ self flag: 'log or do nothing?' ] ]
				ifFalse: [ self flag: 'log or do nothing?' ] ]
		ifNone: [  ].
	^ type
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typInvokedMethods [
	^ self children
		inject: Set new
		into: [ :s :e | 
			s
				addAll: e typInvokedMethods;
				yourself ]
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typIsTyped [
	<typTypeResultAs: 'Boolean'>
	^ self hasProperty: #typType
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typPrevious [
	<typTypeResultAs: '!RBProgramNode'>
	| i previous |
	self parent ifNil: [ ^ nil ].
	i := self parent children detectIndex: [ :e | e == self ].
	i = 1
		ifTrue: [ ^ nil ].
	previous := self parent children at: i - 1.
	"skip temporary declarations"
	^ (self parent isSequence
		and:
			[ (self parent "typCastAs RBSequenceNode") temporaries anySatisfy: [ :e | e == previous ] ])
		ifTrue: [ nil ]
		ifFalse: [ previous ]
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typReachableTypeFor: aString until: aSequenceNode [
	<typTypeArgument: 1 as: 'String<Character>'>
	<typTypeArgument: 2 as: 'RBSequenceNode'>
	<typTypeResultAs: 'TypType'>
	| previous |
	self == aSequenceNode
		ifTrue: [ ^ TypNilType instance ].
	previous := self typPrevious
		ifNil: [ ^ self parent typReachableTypeFor: aString until: aSequenceNode ].
	(previous isAssignment
		and: [ (previous "typCastAs RBAssignmentNode") variable name = aString ])
		ifTrue: [ ^ previous typType ].
	^ previous typReachableTypeFor: aString until: aSequenceNode
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typSignalsAlways [
	<typTypeResultAs: '!Boolean'>
	^ false
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typType [
	<typTypeResultAs: 'TypType'>
	^ (self
		propertyAt: #typType
		ifAbsentPut: [ "need to set property to default to unknown on recursive calls"
			self propertyAt: #typType put: TypUnknownType instance.
			self typAnnotateType: self typTypeRecursive ]) "typCastAs TypType"
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBProgramNode >> typTypeReset [
	self removeProperty: #typType ifAbsent: [  ].
	self children do: #typTypeReset
]
