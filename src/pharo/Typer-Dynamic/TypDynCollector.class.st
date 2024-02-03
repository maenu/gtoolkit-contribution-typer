Class {
	#name : #TypDynCollector,
	#superclass : #TypInfState,
	#instVars : [
		'assign',
		'return'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynCollector >> asIdentityDictionary [
	| result |
	result := Dictionary new: tally.
	self
		associationsDo: [ :a | 
			| key |
			key := a at: 1.
			(key isKindOf: CompiledMethod)
				ifTrue: [ | results arguments |
					results := IdentitySet new.
					arguments := key numArgs typTimesCollect: [ :i | IdentitySet new ].
					(a at: 3)
						do: [ :e | 
							results add: e value.
							e key with: arguments do: [ :f :g | g add: f ] ].
					results := (results collect: #typInfType) typAsType.
					arguments := arguments collect: [ :c | (c collect: #typInfType) typAsType ].
					(results isUnion and: [ results hasSuper ])
						ifTrue: [ results := results super ].
					arguments := arguments
							collect: [ :e | (e isUnion and: [ e hasSuper ]) ifTrue: [ e super ] ifFalse: [ e ] ].
					result
						at: key methodClass -> key selector
						put: (CompiledMethod typAsFunctionTypeWithResult: results arguments: arguments) ]
				ifFalse: [ result at: key put: (a at: 3) typAsType ] ].
	^ result
]

{ #category : #initialization }
TypDynCollector >> initialize [
	super initialize.
	return := MetaLink new
			metaObject: self;
			selector: #metaReturn:receiver:arguments:in:;
			control: #after;
			arguments: #(value receiver arguments originalmethod).
	assign := MetaLink new
			metaObject: self;
			selector: #metaAssign:in:;
			control: #after;
			arguments: #(newValue node)
]

{ #category : #accessing }
TypDynCollector >> instrument: aCollection doing: aBlock [
	aCollection
		do: [ :m | 
			m ast link: return.
			m ast assignmentNodes
				reject: [ :n | n variable isLocalVariable ]
				thenDo: [ :n | n link: assign ] ].
	aBlock
		ensure: [ return uninstall.
			assign uninstall ]
]

{ #category : #accessing }
TypDynCollector >> invalidate [
	return uninstall.
	assign uninstall.
	super initialize
]

{ #category : #accessing }
TypDynCollector >> metaAssign: anObject in: aNode [
	| key value |
	key := aNode variable variable.
	value := anObject typInfType.
	self
		privateAssociationAt: key
		ifPresent: [ :a | (a at: 3) add: value ]
		ifAbsentPut: [ {key.
				nil.
				OrderedCollection with: value} ]
]

{ #category : #accessing }
TypDynCollector >> metaReturn: anotherObject receiver: anObject arguments: aCollection in: aMethod [
	| key value |
	key := aMethod.
	value := aCollection -> (anotherObject ifNil: [ anObject ]).
	self
		privateAssociationAt: key
		ifPresent: [ :a | (a at: 3) add: value ]
		ifAbsentPut: [ {key.
				nil.
				OrderedCollection with: value} ]
]
