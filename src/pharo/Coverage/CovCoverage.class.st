Class {
	#name : #CovCoverage,
	#superclass : #Object,
	#classInstVars : [
		'messageResultLink',
		'assignmentLink',
		'contextLink',
		'messageLink',
		'returnLink',
		'installedAsts'
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
	contextLink := MetaLink new
		metaObject: #node;
		selector: #covInvoke:;
		arguments: #(context).
	messageLink := MetaLink new
		metaObject: #node;
		selector: #covSend:to:with:;
		arguments: #(selector receiver arguments).
	messageResultLink := MetaLink new
		metaObject: #node;
		selector: #covResult:;
		control: #after;
		arguments: #(value).
	assignmentLink := MetaLink new
		metaObject: #node;
		selector: #covAssign:;
		control: #after;
		arguments: #(value).
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
	[ self installOnMethodUnsafe: aMethod.
	Transcript
		show: 'Worked ' , aMethod printString;
		cr ]
		on: Error
		do: [ :e | 
			self uninstallFromMethod: aMethod.
			Transcript
				show: 'Failed ' , e class name , ' ' , aMethod printString;
				cr.
			aMethod recompile ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installOnMethodUnsafe: aMethod [
	self flag: 'message is problematic'.
	installedAsts at: aMethod methodClass -> aMethod selector put: aMethod ast.
	aMethod ast covUninstall.
	aMethod ast propertyAt: #cov put: true.
	aMethod ast do: [ :n | self install: contextLink onNode: n ].
	aMethod ast covAllMessages
		do: [ :n | 
			self
				install: messageLink onNode: n;
				install: messageResultLink onNode: n ].
	aMethod ast covAllAssignments do: [ :n | self install: assignmentLink onNode: n ].
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
	method := aNode methodNode method.
	^ self
		installedAstFor: method
		ifFound: [ :e | 
			| nodes installedNodes i |
			e formattedCode = aNode methodNode formattedCode
				ifFalse: [ ^ anotherBlock cull: e ].
			nodes := aNode methodNode allChildren.
			installedNodes := e methodNode allChildren.
			self assert: [ nodes size = installedNodes size ].
			i := nodes indexOf: aNode.
			aBlock cull: (installedNodes at: i) ]
		ifNone: anotherBlock
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromAllInstalledAsts [
	messageLink uninstall.
	messageResultLink uninstall.
	returnLink uninstall.
	contextLink uninstall.
	assignmentLink uninstall.
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
	aMethod ast do: [ :n | n removeLink: contextLink ].
	aMethod ast covAllMessages
		do: [ :n | 
			n
				removeLink: messageLink;
				removeLink: messageResultLink ].
	aMethod ast covAllAssignments do: [ :n | n removeLink: assignmentLink ].
	aMethod ast covAllReturns do: [ :n | n removeLink: returnLink ].
	installedAsts removeKey: aMethod methodClass -> aMethod selector ifAbsent: [  ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromPackage: aPackage [
	aPackage methods do: [ :e | self uninstallFromMethod: e ]
]
