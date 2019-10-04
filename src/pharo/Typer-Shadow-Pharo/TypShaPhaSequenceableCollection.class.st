Class {
	#name : #TypShaPhaSequenceableCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaSequenceableCollection class >> ___ofSize: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> shadowedClass [
	^ SequenceableCollection class
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType scope at: '@E' ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___at: _a ifAbsent: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType: {}
						result: TypUnknownType instance
						optionalParameters: false ] ];
		resultType: [ :a :s :r | 
			{(a receiverType bindingAt: '@A').
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___beginsWith: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___copyFrom: _a to: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___detectIndex: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: Boolean typAsType optionalParameters: false ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___detectIndex: _a ifNone: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ BlockClosure typAsType asFunctionType: {(a receiverType bindingAt: '@A')} result: Boolean typAsType optionalParameters: false ]
				ifFalse: [ {TypUnknownType instance.
					(BlockClosure typAsType asFunctionType: {} result: Boolean typAsType optionalParameters: false)} typAsType ] ];
		resultType: [ :a | 
			| none |
			none := a argumentTypes at: 2.
			{Integer typAsType.
			((none representsClassDescription and: [ none classDescription == BlockClosure ])
				ifTrue: [ none result ]
				ifFalse: [ none ])} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___endsWith: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___first [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___indexOf: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindingAt: '@A' ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___isEmpty [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___last [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___reversed [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___sort: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			| type |
			type := a receiverType isParametric
				ifTrue: [ a receiverType bindingAt: '@A' ]
				ifFalse: [ TypUnknownType instance ].
			BlockClosure typAsType
				asFunctionType:
					{type.
					type}
				result: Boolean typAsType
				optionalParameters: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___withIndexCollect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType:
					{(a receiverType bindingAt: '@A').
					Integer typAsType}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithBindings: {('@A' -> (a argumentTypes at: 1) result)} asOrderedDictionary ];
		yourself
]

{ #category : #enumerating }
TypShaPhaSequenceableCollection >> ___withIndexDo: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asFunctionType:
					{(a receiverType bindingAt: '@A').
					Integer typAsType}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___withIndexSelect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType:
					{(a receiverType bindingAt: '@A').
					Integer typAsType}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithBindings: {('@A' -> (a argumentTypes at: 1) result)} ];
		yourself
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> asType: aClass [
	^ aClass typAsParametricType: {('@A' -> (TypTypeVariableType named: '@A'))} asOrderedDictionary
]
