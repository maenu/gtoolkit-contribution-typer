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
	installedMethods := Set new.
	contextLink := MetaLink new
		metaObject: #node;
		selector: #covInvoke:;
		control: #after;
		arguments: #(context).
	assignmentLink := MetaLink new
		metaObject: #node;
		selector: #covAssign:;
		control: #after;
		arguments: #(value).
	messageLink := MetaLink new
		metaObject: #node;
		selector: #covSend:to:with:;
		arguments: #(selector receiver arguments).
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
	(aClass methods reject: #isExtension) do: [ :e | self installOnMethod: e ].
	aClass class methods do: [ :e | self installOnMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installOnMethod: aMethod [
	| method |
	self uninstallFromMethod: aMethod.
	"after uninstall method is detached, get executed method"
	method := aMethod methodClass >> aMethod selector.
	installedMethods add: method.
	method methodNode do: [ :n | self install: contextLink onNode: n ].
	method ast covAllMessages do: [ :n | self install: messageLink onNode: n ].
	method ast covAllAssignments do: [ :n | self install: assignmentLink onNode: n ].
	method ast covAllReturns do: [ :n | self install: returnLink onNode: n ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> installOnPackage: aPackage [
	aPackage definedClasses do: [ :e | self installOnClass: e ].
	aPackage extensionMethods do: [ :e | self installOnMethod: e ]
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
		covMethodFor: aMethod
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
	installedMethods copy do: [ :e | self uninstallFromMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromClass: aClass [
	(aClass methods reject: #isExtension) do: [ :e | self uninstallFromMethod: e ].
	aClass class methods do: [ :e | self uninstallFromMethod: e ]
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromMethod: aMethod [
	installedMethods remove: aMethod ifAbsent: [  ].
	aMethod recompile
]

{ #category : #'as yet unclassified' }
CovCoverage class >> uninstallFromPackage: aPackage [
	aPackage definedClasses do: [ :e | self uninstallFromClass: e ].
	aPackage extensionMethods do: [ :e | self uninstallFromMethod: e ]
]
