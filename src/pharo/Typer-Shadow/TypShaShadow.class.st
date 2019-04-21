Class {
	#name : #TypShaShadow,
	#superclass : #TypResolver,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaShadow class >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypNamedType'>
	^ aClass typAsNamedType
]

{ #category : #'class initialization' }
TypShaShadow class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> methodResolverIndex [
	^ (self class selectors
		select: [ :e | (e beginsWith: '___') or: [ e beginsWith: '~~~' ] ])
		collect: [ :e | 
			| name_ |
			name_ := e copyFrom: 4 to: e size.
			self shadowedClass name -> name_
				-> {(self perform: e asSymbol withEnoughArguments: {})} ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	self subclassResponsibility
]

{ #category : #converting }
TypShaShadow class >> typeResolverIndex [
	^ {(self shadowedClass name
		->
			{(TypTypeResolver new
				type: [ :a | self asType: a clazz ];
				yourself)})}
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> variableResolverIndex [
	^ (self class instVarNames select: [ :e | e beginsWith: '___' ])
		collect: [ :e | 
			self shadowedClass name -> (e copyFrom: 4 to: e size)
				-> {(self instVarNamed: e)} ]
]

{ #category : #converting }
TypShaShadow >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypType'>
	^ aClass typAsNamedType
]

{ #category : #'as yet unclassified' }
TypShaShadow >> methodResolverIndex [
	^ (self class selectors
		select: [ :e | (e beginsWith: '___') or: [ e beginsWith: '~~~' ] ])
		collect: [ :e | 
			| name |
			name := e copyFrom: 4 to: e size.
			self shadowedClass name -> name
				-> {(self perform: e asSymbol withEnoughArguments: {})} ]
]

{ #category : #accessing }
TypShaShadow >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	^ self class shadowedClass instanceSide
]

{ #category : #converting }
TypShaShadow >> typeResolverIndex [
	^ {(self shadowedClass name
		->
			{(TypTypeResolver new
				type: [ :a | self asType: a clazz ];
				yourself)})}
]

{ #category : #'as yet unclassified' }
TypShaShadow >> variableResolverIndex [
	^ ((self class instVarNames select: [ :e | e beginsWith: '___' ])
		collect: [ :e | 
			| name |
			name := e copyFrom: 4 to: e size.
			self shadowedClass name -> name -> {(self instVarNamed: e)} ])
		,
			((self class classVarNames select: [ :e | e beginsWith: '___' ])
				collect: [ :e | 
					| name |
					name := e copyFrom: 4 to: e size.
					self shadowedClass name -> name
						-> {(self class instanceSide classVarNamed: e)} ])
]
