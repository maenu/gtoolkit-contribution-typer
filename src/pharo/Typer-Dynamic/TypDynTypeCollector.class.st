Class {
	#name : #TypDynTypeCollector,
	#superclass : #Object,
	#instVars : [
		'invokeLink',
		'returnLink',
		'methodResolvers'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #converting }
TypDynTypeCollector >> asMethodResolvers [
	^ TypMethodResolvers new
		resolvers: methodResolvers;
		yourself
]

{ #category : #'as yet unclassified' }
TypDynTypeCollector >> collectAll: aCollection doing: aBlock [
	| asts |
	asts := aCollection
		collect: [ :e | 
			| ast |
			ast := e ast.
			self installOn: ast.
			ast ].
	^ [ aBlock value ]
		ensure: [ methodResolvers addAll: (asts collect: #typDynAsMethodResolver).
			asts do: [ :e | self uninstallFrom: e ] ]
]

{ #category : #initialization }
TypDynTypeCollector >> initialize [
	methodResolvers := OrderedCollection new.
	invokeLink := MetaLink new
		metaObject: #node;
		selector: #typDynInvokeIn:;
		arguments: #(context).
	returnLink := MetaLink new
		metaObject: #node;
		selector: #typDynReturn:;
		arguments: #(value)
]

{ #category : #'as yet unclassified' }
TypDynTypeCollector >> install: aMetaLink on: aNode [
	aNode propertyAt: #typDynMonitor ifAbsentPut: [ Monitor new ].
	aNode link: aMetaLink
]

{ #category : #'as yet unclassified' }
TypDynTypeCollector >> installOn: aNode [
	aNode typDynUninstall.
	aNode propertyAt: #typDyn put: true.
	aNode do: [ :n | self install: invokeLink on: n ].
	aNode typDynReturnNodes do: [ :n | self install: returnLink on: n ].
	aNode method reflectiveMethod compileAndInstallCompiledMethod.
	^ aNode method ast
]

{ #category : #'as yet unclassified' }
TypDynTypeCollector >> uninstallFrom: aNode [
	aNode removeProperty: #typDyn ifAbsent: [  ].
	aNode typDynUninstall.
	aNode do: [ :n | n removeLink: invokeLink ].
	aNode typDynReturnNodes do: [ :n | n removeLink: returnLink ].
]
