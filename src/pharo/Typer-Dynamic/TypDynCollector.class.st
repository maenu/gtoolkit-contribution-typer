Class {
	#name : #TypDynCollector,
	#superclass : #Object,
	#instVars : [
		'return',
		'assign',
		'before',
		'result',
		'contexts',
		'report'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #initialization }
TypDynCollector >> initialize [

	super initialize.
	before := MetaLink new
		          metaObject: self;
		          selector: #metaBefore:;
		          arguments: #( context ).
	return := MetaLink new
		          metaObject: self;
		          selector: #metaReturn:in:;
		          arguments: #( value context ).
	assign := MetaLink new
		          metaObject: self;
		          selector: #metaAssign:in:;
		          control: #after;
		          arguments: #( value node )
]

{ #category : #'as yet unclassified' }
TypDynCollector >> install: aMethodNode [

	aMethodNode link: before.
	aMethodNode allChildren
		select: #isReturn
		thenDo: [ :e | e link: return ].
	aMethodNode assignmentNodes
		reject: [ :e | e variable isLocalVariable ]
		thenDo: [ :e | e link: assign ]
]

{ #category : #accessing }
TypDynCollector >> instrument: aPackage doing: aBlock [

	report := TypDynReport
		          package: aPackage
		          variable: [ LinkedList new ]
		          method: [ LinkedList new ].
	contexts := Dictionary new.
	aPackage methods do: [ :e | 
		self install: (e ast
				 doSemanticAnalysis;
				 yourself) ].
	aBlock ensure: [ self uninstall ].
	contexts do: [ :e | 
		(report methodAt: e key) add: (CompiledMethod
				 typAsFunctionTypeWithResult: e value first
				 arguments: e value allButFirst) ].
	contexts removeAll.
	report reduce.
	^ report
]

{ #category : #'as yet unclassified' }
TypDynCollector >> metaAssign: anObject in: aNode [

	(report variableAt: aNode variable variable) add: anObject typInfType
]

{ #category : #'as yet unclassified' }
TypDynCollector >> metaBefore: aContext [

	contexts
		at: aContext identityHash
		put: aContext method -> ({ aContext receiver typInfType }
			 , (aContext arguments collect: #typInfType))
]

{ #category : #accessing }
TypDynCollector >> metaReturn: anObject in: aContext [

	| association |
	association := contexts at: aContext home identityHash.
	association value at: 1 put: anObject typInfType
]

{ #category : #'as yet unclassified' }
TypDynCollector >> uninstall [

	before uninstall.
	return uninstall.
	assign uninstall
]
