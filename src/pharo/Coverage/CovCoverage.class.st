Class {
	#name : #CovCoverage,
	#superclass : #Object,
	#classInstVars : [
		'invokeLink',
		'returnLink',
		'installedAsts',
		'returnDefaultLink'
	],
	#category : #'Coverage-Core'
}

{ #category : #'as yet unclassified' }
CovCoverage class >> finalize [
	self uninstallFromAllInstalledAsts.
	super finalize
]

{ #category : #'as yet unclassified' }
CovCoverage class >> initialize [
	installedAsts := Dictionary new.
	invokeLink := MetaLink new
		metaObject: #node;
		selector: #covInvoke:;
		arguments: #(context).
	returnDefaultLink := MetaLink new
		metaObject: #node;
		control: #after;
		selector: #covReturnDefault.
	returnLink := MetaLink new
		metaObject: #node;
		selector: #covReturn:;
		arguments: #(value)
]

{ #category : #'as yet unclassified' }
CovCoverage class >> install: aMetaLink onNode: aNode [
	aNode propertyAt: #covMonitor ifAbsentPut: [ Monitor new ].
	aNode link: aMetaLink
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installOnClass: aClass [
	aClass methods do: [ :e | self installOnMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installOnMethod: aMethod [
	installedAsts at: aMethod methodClass -> aMethod selector put: aMethod ast.
	aMethod ast covUninstall.
	aMethod ast propertyAt: #cov put: true.
	aMethod ast do: [ :n | self install: invokeLink onNode: n ].
	"aMethod ast body do: [ :n | self install: returnDefaultLink onNode: n ]".
	aMethod ast covAllReturns do: [ :n | self install: returnLink onNode: n ].
	aMethod reflectiveMethod compileAndInstallCompiledMethod
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installOnPackage: aPackage [
	aPackage methods do: [ :e | self installOnMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installedAstFor: aMethod ifFound: aBlock ifNone: anotherBlock [
	^ installedAsts at: aMethod methodClass -> aMethod selector ifPresent: aBlock ifAbsent: anotherBlock
]

{ #category : #accessing }
CovCoverage class >> installedAsts [
	^ installedAsts
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installedNodeFor: aNode ifFound: aBlock ifNone: anotherBlock [
	| method |
	self flag: 'find better heuristic for match, = is imprecise'.
	method := aNode methodNode method.
	^ self installedAstFor: method ifFound: [ :e | e methodNode allChildren detect: [ :f | f = aNode ] ifFound: aBlock ifNone: anotherBlock ] ifNone: anotherBlock
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromAllInstalledAsts [
	invokeLink uninstall.
	returnDefaultLink uninstall.
	returnLink uninstall.
	installedAsts copy do: [ :e | self uninstallFromMethod: e method ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromClass: aClass [
	aClass methods do: [ :e | self uninstallFromMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromMethod: aMethod [
	aMethod ast removeProperty: #cov ifAbsent: [  ].
	aMethod ast covUninstall.
	aMethod ast do: [ :n | n removeLink: invokeLink ].
	aMethod ast body do: [ :n | n removeLink: returnDefaultLink ].
	aMethod ast covAllReturns do: [ :n | n removeLink: returnLink ].
	installedAsts removeKey: aMethod methodClass -> aMethod selector ifAbsent: [  ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromPackage: aPackage [
	aPackage methods do: [ :e | self uninstallFromMethod: e ]
]
