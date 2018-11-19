Class {
	#name : #CovCoverage,
	#superclass : #Object,
	#classInstVars : [
		'installedMethods',
		'assignmentLink',
		'contextLink',
		'messageLink',
		'returnLink'
	],
	#category : #Coverage
}

{ #category : #'as yet unclassified' }
CovCoverage class >> covAssignsIn: aMethod for: aNode [
	^ self covPropertiesIn: aMethod for: aNode named: #covAssigns
]

{ #category : #'as yet unclassified' }
CovCoverage class >> covInvocationsIn: aMethod for: aNode [
	^ self covPropertiesIn: aMethod for: aNode named: #covInvocations
]

{ #category : #'as yet unclassified' }
CovCoverage class >> covPropertiesIn: aMethod for: aNode named: aSymbol [
	^ self
		installedNodeIn: aMethod
		for: aNode
		ifFound: aSymbol
		ifNone: [ OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> covReturnsIn: aMethod for: aNode [
	^ self covPropertiesIn: aMethod for: aNode named: #covReturns
]

{ #category : #'as yet unclassified' }
CovCoverage class >> covSendsIn: aMethod for: aNode [
	^ self covPropertiesIn: aMethod for: aNode named: #covSends
]

{ #category : #'class initialization' }
CovCoverage class >> initialize [
	installedMethods ifNotNil: [ self uninstallFromAllInstalledMethods ].
	installedMethods := Set new.
	contextLink := MetaLink new
		metaObject: #node;
		selector: #covInvoke:;
		arguments: #(context).
	messageLink := MetaLink new
		metaObject: #node;
		selector: #covSend:to:with:resultingIn:;
		control: #after;
		arguments: #(selector receiver arguments value).
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
	aMethod ast propertyAt: #cov put: true.
	Transcript
		show: 'Worked ' , aMethod printString;
		cr ]
		on: Error
		do: [ :e | 
			aMethod ast propertyAt: #cov put: false.
			Transcript
				show: 'Failed ' , e class name , ' ' , aMethod printString;
				cr.
			aMethod recompile ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installOnMethodUnsafe: aMethod [
	self flag: 'message is problematic'.
	aMethod ast do: [ :n | self install: contextLink onNode: n ].
	aMethod ast covAllMessages do: [ :n | self install: messageLink onNode: n ].
	aMethod ast covAllAssignments do: [ :n | self install: assignmentLink onNode: n ].
	aMethod ast covAllReturns do: [ :n | self install: returnLink onNode: n ].
	installedMethods add: (aMethod methodClass >> aMethod selector) compileAndInstallCompiledMethod
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installOnPackage: aPackage [
	aPackage methods do: [ :e | self installOnMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installedMethodFor: aMethod ifFound: aBlock ifNone: anotherBlock [
	^ installedMethods
		detect: [ :e | e methodClass = aMethod methodClass and: [ e selector = aMethod selector and: [ e ast formattedCode = aMethod ast formattedCode ] ] ]
		ifFound: aBlock
		ifNone: anotherBlock
]

{ #category : #accessing }
CovCoverage class >> installedMethods [
	^ installedMethods
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installedNodeIn: aMethod for: aNode ifFound: aBlock ifNone: anotherBlock [
	^ self
		installedMethodFor: aMethod
		ifFound: [ :e | 
			| nodes installedNodes i |
			nodes := aMethod ast allChildren.
			installedNodes := e ast allChildren.
			self assert: [ nodes size = installedNodes size ].
			i := nodes indexOf: aNode.
			aBlock cull: (installedNodes at: i) ]
		ifNone: anotherBlock
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromAllInstalledMethods [
	messageLink uninstall.
	returnLink uninstall.
	contextLink uninstall.
	assignmentLink uninstall.
	installedMethods copy do: [ :e | self uninstallFromMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromClass: aClass [
	aClass methods do: [ :e | self uninstallFromMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromMethod: aMethod [
	aMethod ast removeProperty: #cov.
	installedMethods remove: aMethod ifAbsent: [  ].
	aMethod recompile
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromPackage: aPackage [
	aPackage methods do: [ :e | self uninstallFromMethod: e ]
]
