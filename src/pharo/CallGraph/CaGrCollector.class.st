Class {
	#name : #CaGrCollector,
	#superclass : #Object,
	#classInstVars : [
		'invokeLink',
		'returnLink',
		'installedAsts'
	],
	#category : #CallGraph
}

{ #category : #'as yet unclassified' }
CaGrCollector class >> astFor: aMethod ifFound: aBlock ifNone: anotherBlock [
	^ installedAsts at: aMethod methodClass -> aMethod selector ifPresent: aBlock ifAbsent: anotherBlock
]

{ #category : #accessing }
CaGrCollector class >> asts [
	^ installedAsts
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> finalize [
	self uninstallFromAll.
	super finalize
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> initialize [
	installedAsts := Dictionary new.
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
CaGrCollector class >> install: aMetaLink on: aNode [
	aNode propertyAt: #typDynMonitor ifAbsentPut: [ Monitor new ].
	aNode link: aMetaLink
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> installOnClass: aClass [
	aClass methods do: [ :e | self installOnMethod: e ]
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> installOnMethod: aMethod [
	installedAsts at: aMethod methodClass -> aMethod selector put: aMethod ast.
	aMethod ast typDynUninstall.
	aMethod ast propertyAt: #typDyn put: true.
	aMethod ast do: [ :n | self install: invokeLink on: n ].
	aMethod ast typDynReturnNodes do: [ :n | self install: returnLink on: n ].
	aMethod reflectiveMethod compileAndInstallCompiledMethod
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> installOnPackage: aPackage [
	aPackage methods do: [ :e | self installOnMethod: e ]
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> installedNodeFor: aNode ifFound: aBlock ifNone: anotherBlock [
	| method |
	self flag: 'find better heuristic for match, = is imprecise'.
	method := aNode methodNode method.
	^ self astFor: method ifFound: [ :e | e methodNode allChildren detect: [ :f | f = aNode ] ifFound: aBlock ifNone: anotherBlock ] ifNone: anotherBlock
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> uninstallFrom: aMethod [
	aMethod ast removeProperty: #typDyn ifAbsent: [  ].
	aMethod ast typDynUninstall.
	aMethod ast do: [ :n | n removeLink: invokeLink ].
	aMethod ast typDynReturnNodes do: [ :n | n removeLink: returnLink ].
	installedAsts removeKey: aMethod methodClass -> aMethod selector ifAbsent: [  ]
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> uninstallFromAll [
	invokeLink uninstall.
	returnLink uninstall.
	installedAsts copy do: [ :e | self uninstallFrom: e method ]
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> uninstallFromClass: aClass [
	aClass methods do: [ :e | self uninstallFrom: e ]
]

{ #category : #'as yet unclassified' }
CaGrCollector class >> uninstallFromPackage: aPackage [
	aPackage methods do: [ :e | self uninstallFrom: e ]
]
